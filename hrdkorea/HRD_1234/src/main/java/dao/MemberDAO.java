package dao;

import java.util.ArrayList;
import java.util.List;

import dbpkg.JDBConnect;
import jakarta.servlet.ServletContext;
import vo.MemberVO;

public class MemberDAO extends JDBConnect {
	public MemberDAO() {
		super();
	}
	
	public List<MemberVO> selectList() {
		List<MemberVO> bbs = new ArrayList<MemberVO>();
		
		String query = "SELECT * FROM member_tbl_02";				  
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getString("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getString("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
				
				bbs.add(vo);				
			}
		} catch (Exception e) {
			System.out.println("회원목록 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;		
	}
}
