package Menu;

public class LocalSpecial extends Menus {
	String location;
	
	public LocalSpecial(int id, String name, int price, String location) {
		super(id,name,price);
		this.location=location;
	}

}
