package pl.wap;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.http.HttpSession;


public class Summery {
	
public String getBudgetsSummery(Object userId) {
		
		String sql = "SELECT bud.name, ROUND((sum(amount)/budget*100), 2) as procent, DATE_ADD(bud.start_date, INTERVAL bud.frequency month) as end_date FROM budgets bud  JOIN expenses exp ON bud.category = exp.category WHERE bud.user = ? AND (NOW() BETWEEN bud.start_date AND DATE_ADD(bud.start_date, INTERVAL bud.frequency month) ) group by bud.name";
		String dataPoints = null;
		
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				map = new HashMap<Object,Object>(); map.put("label", rse.getString("bud.name") + " | end date: " + rse.getString("end_date")); map.put("y", rse.getFloat("procent")); list.add(map);
			}
		} catch(Exception e){
			System.out.println(e);
		}
 
		dataPoints = gsonObj.toJson(list);
		return dataPoints;
	}
	
	public String getWeeklyExpenses(Object userId) {
		
		String sql = "SELECT ROUND(sum(amount), 2) AS sum, date FROM expenses WHERE (date > DATE_ADD(NOW(),INTERVAL -1 WEEK)) AND user = ? group by DATE";
		String dataPoints = null;
		
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				map = new HashMap<Object,Object>(); map.put("label", rse.getString("date")); map.put("y", rse.getString("sum")); list.add(map);
			}
		} catch(Exception e){
			System.out.println(e);
		}
 
		dataPoints = gsonObj.toJson(list);
		return dataPoints;
	}
	
	public String getExpensesByWeekDay(Object userId, String weekday, int weekNumber) {
		
		String sql = "SELECT DATE_FORMAT(date, '%W'), date, round(sum(amount), 2) as sum FROM expenses WHERE user = ? AND date between subdate(curdate() + INTERVAL ? WEEK,dayofweek(curdate())+5) and subdate(curdate() + INTERVAL ? WEEK,dayofweek(curdate())-1) AND DATE_FORMAT(date, '%W') like ? group by date;";
		String sum = null;
		
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ste.setObject(2, weekNumber);
			ste.setObject(3, weekNumber);
			ste.setObject(4, weekday);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				sum = rse.getString("sum");
			}
		} catch(Exception e){
			System.out.println(e);
		}
 
		return sum;
	}
	
	public String getMonthlyExpensesByCategory(Object userId) {
	
		String sql = "SELECT round(sum(exp.amount), 2) as sum, cat.name FROM expenses exp JOIN expenses_categories cat ON exp.category = cat.id WHERE exp.user = ? AND (date > DATE_ADD(NOW(),INTERVAL -1 MONTH)) group by cat.name ";
		String dataPoints = null;
		
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				
				map = new HashMap<Object,Object>(); map.put("label", rse.getString("cat.name")); map.put("y", rse.getString("sum")); list.add(map);
			}
		} catch(Exception e){
			System.out.println(e);
		}
 
		dataPoints = gsonObj.toJson(list);
		return dataPoints;
	}
	
	public String getMonthlyIncomesByCategory(Object userId) {
		
		String sql = "SELECT round(sum(inc.amount), 2) as sum, cat.name FROM incomes inc JOIN incomes_categories cat ON inc.category = cat.id WHERE inc.user = ? AND (date > DATE_ADD(NOW(),INTERVAL -1 MONTH)) group by cat.name ";
		String dataPoints = null;
		
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				map = new HashMap<Object,Object>(); map.put("label", rse.getString("cat.name")); map.put("y", rse.getString("sum")); list.add(map);
			}
		} catch(Exception e){
			System.out.println(e);
		}
 
		dataPoints = gsonObj.toJson(list);
		return dataPoints;
	}
	
	public String getDayExpenses(Object userId) {
		
		String sql = "SELECT date, round(sum(amount), 2) as sum FROM expenses WHERE user = ? group by date";
		String dataPoints = null;
		
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				map = new HashMap<Object,Object>(); map.put("date", rse.getString("date")); map.put("value", rse.getString("sum")); list.add(map);
			}
		} catch(Exception e){
			System.out.println(e);
		}
 
		dataPoints = gsonObj.toJson(list);
		return dataPoints;
	}
	
	public String getExpensesSumMonth(Object userId) {
		String sql = "SELECT round(sum(amount), 2) as sum FROM expenses WHERE user = ? AND (date > DATE_ADD(NOW(),INTERVAL -1 MONTH))";
		String sum = null;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				sum = rse.getString("sum");
			}
		} catch(Exception e){
			System.out.println(e);
		}
		return ifNullGetZero(sum);
	}
	
	public String getExpensesSumLastMonth(Object userId) {
		String sql = "SELECT round(sum(amount), 2) as sum FROM expenses WHERE user = ? AND (date > DATE_ADD(NOW(),INTERVAL -2 MONTH)) AND (date < DATE_ADD(NOW(),INTERVAL -1 MONTH));";
		String sum = null;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				sum = rse.getString("sum");
			}
		} catch(Exception e){
			System.out.println(e);
		}
		return ifNullGetZero(sum);
	}
	
	
	public String getIncomesSumLastMonth(Object userId) {
		String sql = "SELECT round(sum(amount), 2) as sum FROM incomes WHERE user = ? AND (date > DATE_ADD(NOW(),INTERVAL -2 MONTH)) AND (date < DATE_ADD(NOW(),INTERVAL -1 MONTH));";
		String sum = null;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				sum = rse.getString("sum");
			}
		} catch(Exception e){
			System.out.println(e);
		}
		return ifNullGetZero(sum);
	}
	
	public String getExpensesSumWeek(Object userId) {
		String sql = "SELECT round(sum(amount), 2) as sum FROM expenses WHERE user = ? AND (date > DATE_ADD(NOW(),INTERVAL -1 WEEK))";
		String sum = null;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				sum = rse.getString("sum");
			}	
		} catch(Exception e){
			System.out.println(e);
		}
		return ifNullGetZero(sum);
	}
	
	
	public String getIncomesSumMonth(Object userId) {
		String sql = "SELECT round(sum(amount), 2) as sum FROM incomes WHERE user = ? AND (date > DATE_ADD(NOW(),INTERVAL -1 MONTH))";
		String sum = null;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				sum = rse.getString("sum");
			}
	
		} catch(Exception e){
			System.out.println(e);
		}
		return ifNullGetZero(sum);
	}
	
	public String getDaySpendings(Object userId) {
		String sql = "SELECT round(sum(amount), 2) as sum FROM incomes WHERE user = ? AND (date > DATE_ADD(NOW(),INTERVAL -1 MONTH))";
		String sum = null;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				sum = rse.getString("sum");
			}
	
		} catch(Exception e){
			System.out.println(e);
		}
		return ifNullGetZero(sum);
	}
	
	
	public String getIncomesSumWeek(Object userId) {
		String sql = "SELECT round(sum(amount), 2) as sum FROM incomes WHERE user = ? AND (date > DATE_ADD(NOW(),INTERVAL -1 WEEK))";
		String sum = null;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, userId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				sum = rse.getString("sum");
			}
	
		} catch(Exception e){
			System.out.println(e);
		}
		
		return ifNullGetZero(sum);
	}
	
	public String ifNullGetZero(String value) {
		if(value == null) {
			return "0.0";
		} else {
			return value;
		}
		
	}
	
}
