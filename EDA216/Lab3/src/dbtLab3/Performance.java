package dbtLab3;

public class Performance {

	private String title;
	private String date;
	private String theatre;
	private int freeSeats;

	public Performance(String t, String d, String th, int f) {
		title = t;
		date = d;
		theatre = th;
		freeSeats = f;
	}

	public String getTitle() {
		return title;
	}

	public String getDate() {
		return date;
	}

	public String getTheatre() {
		return theatre;
	}

	public int getFreeSeats() {
		return freeSeats;
	}
}
