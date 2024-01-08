import java.util.Scanner;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// Setiap Restauran punya: Romantic (maks 2 org), General (4 org), dan Family (10 org) dan memiliki id, nama menu, dan harga.
		// Restaurant utama (Bandung, Jakarta dan Bali) memiliki Special Menu yang ada tambahan narasi cerita
		// Sehingga resotoran lokal (Surabaya, Samarinda, dan Padang) dpt Local Special untuk tambahan dari lokasi mana dan narasi ciri khas menu
		// Employee memiliki ID, nama, dan resto cabangnya
		// 
		
		Scanner inp = new Scanner(System.in);
		int choice = 0;
		while (choice != 7) {
			System.out.println("Restaurant Reservation");
			System.out.println("1. Bandung");
			System.out.println("2. Jakarta");
			System.out.println("3. Bali");
			System.out.println("4. Surabaya");
			System.out.println("5. Samarinda");
			System.out.println("6. Padang");
			System.out.println("7. Exit");
			System.out.println("Insert Choice [1-7]: ");
			choice = inp.nextInt();
			switch(choice) {
				case 1: { // Bandung
					specialMenu();
					break;
				}
				
				case 2: { // Jakarta
					specialMenu();
					break;
				}
				
				case 3: { // Bali
					specialMenu();
					break;
				}
				
				case 4: { // Surabaya
					localSpecial();
					break;
				}
				
				case 5: { // Samarinda
					localSpecial();
					break;
				}
				
				case 6: { // Padang
					localSpecial();
					break;
				}
				
				default: { // Nomor lain
					break;
				}
			}
		}
		
		
	}

}
