package kr.ac.kopo.product.vo;

public class BudgetVO {
	private String accNo;
	private String category;
	private String budgetName;
	private String budget;
	private String setDate;
	private String dataFull;
	private String budgetNo;
	private int budgetSum;

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBudgetName() {
		return budgetName;
	}

	public void setBudgetName(String budgetName) {
		this.budgetName = budgetName;
	}

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public String getSetDate() {
		return setDate;
	}

	public void setSetDate(String setDate) {
		this.setDate = setDate;
	}

	public String getDataFull() {
		return dataFull;
	}

	public void setDataFull(String dataFull) {
		this.dataFull = dataFull;
	}

	public String getBudgetNo() {
		return budgetNo;
	}

	public void setBudgetNo(String budgetNo) {
		this.budgetNo = budgetNo;
	}

	public int getBudgetSum() {
		return budgetSum;
	}

	public void setBudgetSum(int budgetSum) {
		this.budgetSum = budgetSum;
	}

	@Override
	public String toString() {
		return "BudgetVO [accNo=" + accNo + ", category=" + category + ", budgetName=" + budgetName + ", budget="
				+ budget + ", setDate=" + setDate + ", dataFull=" + dataFull + ", budgetNo=" + budgetNo + ", budgetSum="
				+ budgetSum + "]";
	}

}
