package Reservation;

public class Reservations {
    int restaurantID;
    int people;
    String name;
    String status;
    
	public Reservations(int restaurantID, int people, String name, String status) {
		this.restaurantID = restaurantID;
		this.people = people;
		this.name = name;
		this.status = status;
	}

}
