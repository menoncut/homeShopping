package test;

import java.util.List;

import dao.MemberDAO;
import jakarta.servlet.ServletContext;
import vo.MemberVO;

public class MemberDAOTest {
	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		List<MemberVO> memberList = dao.selectList();
		
		for(MemberVO vo : memberList) {
			System.out.println(vo.getCustno());
			System.out.println(vo.getCustname());
			System.out.println(vo.getPhone());
			System.out.println(vo.getAddress());
			System.out.println(vo.getJoindate());
			System.out.println(vo.getGrade());
			System.out.println(vo.getCity());
		}
		
	}
	
}
