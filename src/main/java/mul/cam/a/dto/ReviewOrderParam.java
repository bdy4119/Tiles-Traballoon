package mul.cam.a.dto;

import java.io.Serializable;

public class ReviewOrderParam implements Serializable{
	
	private String choiceOrder;	//순서 선택
	
	private int orderPageNumber;
	private int orderStart;
	private int orderEnd;
	
	public ReviewOrderParam() {
		
	}

	public ReviewOrderParam(String choiceOrder, int orderPageNumber, int orderStart, int orderEnd) {
		super();
		this.choiceOrder = choiceOrder;
		this.orderPageNumber = orderPageNumber;
		this.orderStart = orderStart;
		this.orderEnd = orderEnd;
	}

	public String getChoiceOrder() {
		return choiceOrder;
	}

	public void setChoiceOrder(String choiceOrder) {
		this.choiceOrder = choiceOrder;
	}

	public int getOrderPageNumber() {
		return orderPageNumber;
	}

	public void setOrderPageNumber(int orderPageNumber) {
		this.orderPageNumber = orderPageNumber;
	}

	public int getOrderStart() {
		return orderStart;
	}

	public void setOrderStart(int orderStart) {
		this.orderStart = orderStart;
	}

	public int getOrderEnd() {
		return orderEnd;
	}

	public void setOrderEnd(int orderEnd) {
		this.orderEnd = orderEnd;
	}

	@Override
	public String toString() {
		return "ReviewOrderDto [choiceOrder=" + choiceOrder + ", orderPageNumber=" + orderPageNumber + ", orderStart="
				+ orderStart + ", orderEnd=" + orderEnd + "]";
	}
	
	
	
}
