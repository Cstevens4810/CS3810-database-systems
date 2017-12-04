/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cshw6;

import java.util.*;
import java.sql.*;
import java.io.*;
import java.util.Scanner;
/**
 * File that can get into a database and make up a fake reservation 
 * Created by Cooper Stevens with help from Kyra Phillips 
 */
public class CSHW6 {
    
    static String username, password, email, firstName, lastName, street, AirlineName, 
        country, deptDate, arrivalDate, cityName, stateCode, countryName, payingCustomerEmail;
    static int postalCode, countryCode, areaCode, localNumber, AirlineCode, originAirportCode, 
        destAirportCode, uniqueFlightNum, deptHour, deptMin, arrivalHour, arrivalMin, airportCode,
        bookingNum, cityCodeOfBooking;
    static Scanner input = new Scanner(System.in);
    static Connection conn = null;
    static ResultSet rs = null;
    static Statement statement = null;
    

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
        getData();
        insertCustomerData();
        makeReservation();
        getConfirmation();
    }
    
     private static void openConnection() {
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
                    username, password);
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }
    }
     
    private static void getData() throws IOException{
     FileWriter fileWriter = new FileWriter("HW6.error", true);
        PrintWriter printWriter = new PrintWriter(fileWriter);
        System.out.println("Before we start, we need your PostgreSQL login information.");
        System.out.print("Username: ");
        username = input.nextLine();
        System.out.print("Password: ");
        password = input.nextLine();
        System.out.println("Welcome to the Flight Reservation System! Let's get your information");
        System.out.print("First name: ");
        firstName = input.nextLine();
        System.out.print("Last name: ");
        lastName = input.nextLine();
        System.out.print("Street address (do not include city, state, or zip): ");
        street = input.nextLine();
        System.out.print("5 digit zip code: ");
        postalCode = Integer.parseInt(input.nextLine());
        int zipLength = Integer.valueOf(postalCode).toString().length();
        if (zipLength != 5) {
            System.out.println("Sorry, that's an invalid zip code. Please restart the program.");
            printWriter.println("Customer " + lastName + ", " + firstName + " had invalid zip code " + postalCode);
            printWriter.close();
            System.exit(0);
        }
        System.out.print("Phone number information: ");
        System.out.println("Country code:");
        countryCode = Integer.parseInt(input.nextLine());
        System.out.println("Area code:");
        areaCode = Integer.parseInt(input.nextLine());
        System.out.println("Local number:");
        localNumber = Integer.parseInt(input.nextLine());
        System.out.print("Email address:");
        email = input.nextLine();
        if (!(email.contains("@"))) {
            System.out.println("Sorry, that's not a valid email address. Please restart the program.");
            printWriter.println("Customer " + lastName + ", " + firstName + " had invalid email " + email);
            printWriter.close();
            System.exit(0);
        }
    }
     
    private static void insertCustomerData(){
        try {
            openConnection();
            conn.setAutoCommit(false);
            statement = conn.createStatement();
            String insertPayer = "INSERT INTO Customer (email, firstName, lastName, street, postalCode) +"
                    + "VALUES ('"+email+"', '"+firstName+"', '"+lastName+"', '"+street+"', '"+postalCode+"')";
            statement.executeUpdate(insertPayer);
            String insertPhoneNumber = "INSERT INTO PayerPhoneNumbers "
                    + "(countryCode, localCode, localNumber) +"
                    + "VALUES ('"+countryCode+"', '"+areaCode+"', '"+localNumber+",)";
            statement.executeUpdate(insertPhoneNumber);
            statement.close();
            conn.commit();
            conn.close();
        }
        catch (SQLException exception){
            System.err.println( exception.getClass().getName()+": "+ exception.getMessage() );
            System.exit(0);
        }
    }

    private static void makeReservation(){
     System.out.print("From what Airline would your flight originate?: ");
        String origin = input.nextLine();
        try {
            openConnection();
            conn.setAutoCommit(false);
            statement = conn.createStatement();
            rs = statement.executeQuery("SELECT * FROM Flights WHERE (originCode = '"+originAirportCode+"')");
            if (!rs.isBeforeFirst()) {
                System.out.println("Sorry, that's not a valid origin city, please restart program.");
                System.exit(0);
            } else {
                System.out.println("Here is a list of flights that originate in " + originAirportCode);
                System.out.println("-------------------------------------------------------------");
            }
            while (rs.next()) {
                String airline = rs.getString("airlineName");
                int flightNumber = rs.getInt("uniqueFlightNumber");
                String originCity = rs.getString("originCode");
                String destinationCity = rs.getString("destinationCode");
                System.out.println(airline + " flight " + flightNumber + " flies from " + originCity + " to " +
                        destinationCity);
            }
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
        }
        int counter = 0;
        do {
            System.out.print("Choose a destination city from the above list: ");
            String destCode = input.nextLine();
            try {
                openConnection();
                conn.setAutoCommit(false);
                statement = conn.createStatement();
                rs = statement.executeQuery("SELECT * FROM Flights WHERE (originCode = '" + originAirportCode + "' AND destinationCode = '"
                        + destAirportCode + "')");
                if (!rs.isBeforeFirst()) {
                    System.out.print("Sorry, that's not a valid destination. ");
                    counter++;
                    if (counter == 3) {
                        System.out.println("Maximum attempts reached, goodbye!");
                        rs.close();
                        statement.close();
                        conn.close();
                        System.exit(0);
                    }
                } else {
                    rs.next();
                    int flightNumber = rs.getInt("Flight_number");
                    break;
                }
            } catch (SQLException e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }
        } while (counter < 3);
        try {
            rs.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
    
    
    private static void getConfirmation() throws IOException{
        FileWriter fileWriter = new FileWriter("HW6.flight", true);
        PrintWriter printWriter = new PrintWriter(fileWriter);

        try {
            openConnection();
            conn.setAutoCommit(false);
            statement = conn.createStatement();
            rs = statement.executeQuery("SELECT * FROM Flights WHERE uniqueFlightNumber = "+uniqueFlightNum+"");
            rs.next();
            String airline = rs.getString("airlineName");
            String origin = rs.getString("originCode");
            String destination = rs.getString("destinationCode");
            String departDate = rs.getString("departureDate");
            String departHour = rs.getString("departureHour");
            String departMin = rs.getString("departureMin");
            String arrivalHour = rs.getString("arrivalHour");
            String arrivalMin = rs.getString("arrivalMin");
            String flightLength = rs.getString("length");
            String confirmation = "";
            confirmation += "Customer Information \n";
            confirmation += "--------------------------\n";
            confirmation += "Name: "+ firstName + " " + lastName + "\n";
            confirmation += "Address: " + street + ", " + postalCode + "\n";
            confirmation += "Phone: " + countryCode + areaCode + localNumber + "\n";
            confirmation += "Email: " + email + "\n\n";
            confirmation += "Flight Information \n";
            confirmation += "--------------------------\n";
            confirmation += "Airline: " + AirlineName + "\n";
            confirmation += "Flight number: " + uniqueFlightNum + "\n";
            confirmation += "Departing from: " + originAirportCode + "\n";
            confirmation += "Destination: " + destAirportCode + "\n";
            confirmation += "Date of Departure: " + departDate + "\n";
            confirmation += "Time of Departure: " + departHour + departMin + "\n";
            confirmation += "Arrival Time: " + arrivalHour + arrivalMin + "\n";
            printWriter.println(confirmation);
            String insertBooking = "INSERT INTO Booking (bookingNum, cityCodeOfBooking,"
                    + " uniqueFlightNum, payingCustomerEmail) VALUES('"+bookingNum+ " " +cityCodeOfBooking+"', "
                    +uniqueFlightNum+", '"+payingCustomerEmail+"')";
            statement.executeUpdate(insertBooking);
            rs.close();
            statement.close();
            printWriter.close();
            conn.commit();
            conn.close();
            System.out.println("Congratulations! Below is your confirmation.");
            System.out.println();
            System.out.println(confirmation);
            System.out.println();
            System.out.println("Your confirmation has also been saved to the HW6.flight file");
        } catch (SQLException e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
    }
}
