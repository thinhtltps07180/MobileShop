package com.poly.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.ReportDAO;
import com.poly.entity.Revenue;

@Controller
public class ReportController {

	private static String[] columns = { "productName", "quantity", "revenue", "min", "max" };
	private static List<Revenue> rv = new ArrayList<>();

	@Autowired
	ReportDAO dao;

	@RequestMapping("admin/revenueByDate")
	public String inventoryByCategory(Model model) {
		model.addAttribute("data", dao.revenueByDate());
		return "admin/revenueByDate";
	}

	@RequestMapping("admin/export")
	public String export(Model model) throws IOException {
		List<Object[]> obj = dao.revenueByDate();
		for (Object[] objects : obj) {
			rv.add(new Revenue(objects[0], objects[1], objects[2], objects[3], objects[4]));
		}
		XSSFWorkbook workbook = new XSSFWorkbook();
	    XSSFSheet sheet = workbook.createSheet("Revenue By Date");
	    Row headerRow = sheet.createRow(0);

		// Create cells
		for (int i = 0; i < columns.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(columns[i]);
//			cell.setCellStyle(headerCellStyle);
		}

		int rowNum = 1;
		for (Revenue revenue : rv) {
			Row row = ((org.apache.poi.ss.usermodel.Sheet) sheet).createRow(rowNum++);

			// Employee's name (Column A)
			row.createCell(0).setCellValue((String) revenue.getProductName());

			// Employee's email (Column B)

			row.createCell(1).setCellValue((Long) revenue.getQuantity());
			// Employee's date of birth (Column C)
			row.createCell(2).setCellValue((Double) revenue.getRevenue());

			// Employee's days of Work (Column D)
			row.createCell(3).setCellValue((Double) revenue.getMin());

			// Employee's salary per day (Column E)
			row.createCell(4).setCellValue((Double) revenue.getMax());
		}
		
	    try {
	        FileOutputStream outputStream = new FileOutputStream("E:/demo/books2.xlsx");
	        workbook.write(outputStream);
	        workbook.close();
	      } catch (FileNotFoundException e) {
	        e.printStackTrace();
	      } catch (IOException e) {
	        e.printStackTrace();
	      }
	      System.out.println("Done");


		return "admin/revenueByDate";
	}

}
