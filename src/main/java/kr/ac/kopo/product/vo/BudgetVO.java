package kr.ac.kopo.product.vo;

public class BudgetVO {
	private String accNo;
	private String category;
	private String budgetName;
	private String budget;
	private String setDate;
	private String dataFull;

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

	@Override
	public String toString() {
		return "BudgetVO [accNo=" + accNo + ", category=" + category + ", budgetName=" + budgetName + ", budget="
				+ budget + ", setDate=" + setDate + ", dataFull=" + dataFull + "]";
	}

}
