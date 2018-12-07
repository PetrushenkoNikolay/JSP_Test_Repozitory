package product;

public class Product {
	private int id;
	private String description;
	private String color;
	private String brand;
	private String name;
	private double price;
	
	public Product(String description, String color, String brand, String name, double price) {
		super();
		this.description = description;
		this.color = color;
		this.brand = brand;
		this.name = name;
		this.price = price;
	}
	
	public Product() {
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
