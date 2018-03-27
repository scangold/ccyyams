package com.fh.archive;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;



public class ReadTxtFile {

	public static List<Object> readfile(String filePath, String fileName, int startrow) {
		List<Object> varList = new ArrayList<Object>();
		try {

			String encoding = "utf-8";
			String lineTxt = null;

			File tfile = new File(filePath, fileName);
			InputStreamReader insread = new InputStreamReader(
					new FileInputStream(tfile), encoding);
			BufferedReader bufferedReader = new BufferedReader(insread);

			while ((lineTxt = bufferedReader.readLine()) != null) {
				String linestr = lineTxt;

				for (int i = 0; i < linestr.length(); i++) {
					varList.add(linestr.charAt(i));
				}
			}
			insread.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return varList;
	}
}
