package com.yy.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.yy.dao.EmailDao;
import com.yy.entity.Email;
import com.yy.util.DBUtils;

public class EmailDaoImpl implements EmailDao {

	@Override
	public List<Email> queryMailList(String recipient) {
		
		List<Email> resultList = new ArrayList<Email>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		Email email = null;
		
		String sql = "select * from t_email m where m.recipient = ? order by send_date desc";
		try {
			conn = DBUtils.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				email = emailUtil(rs);
				resultList.add(email);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs, pstmt, conn);
		}
		return resultList;
	}

	@Override
	public Email queryMail(int mailId) {
		Email email = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from t_mail where mail_id = ?";

		try {
			conn = DBUtils.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				email = emailUtil(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtils.close(rs, pstmt, conn);
		}

		return email;
	}

	
	private Email emailUtil(ResultSet rs) throws SQLException {
		Email email = new Email();
		email.setEmailId(rs.getInt("email_id"));
		email.setEmailTitle(rs.getString("email_title"));
		email.setEmailContent(rs.getString("email_content"));
		email.setSender(rs.getString("sender"));
		email.setRecipient(rs.getString("recipient"));
		email.setSendTime(new Date(rs.getTimestamp("send_time").getTime()));
		
		return email;
	}
}
