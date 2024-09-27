package com.green.connect.controller;

import java.io.File;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.connect.dao.IBoardDao;
import com.green.connect.dto.Board;
import com.green.connect.dto.Like;
import com.green.connect.dto.Reply;
import com.green.connect.dto.User;

@Controller
@RequestMapping("/member")
public class MemberBoardController {

	@Autowired
	private IBoardDao iBoardDao;
	
	@RequestMapping("/writeForm")
	public String writeForm(Model model) {
		System.out.println(iBoardDao.getCategoryList());
		model.addAttribute("categoryList", iBoardDao.getCategoryList());
		return "member/writeForm";
	}
		
	@RequestMapping("/boardList")
	public String boardListPage(Model model, @RequestParam("categoryNo") int categoryNo) {
		//카테고리 번호를 전달받아 해당 카테고리 게시판 리스트만출력
		List<Board> boardList = iBoardDao.getBoardList(categoryNo);
	
		model.addAttribute("boardList", boardList);
		return "member/boardListPage";
	}
	
	@RequestMapping("/registBoard")
	public String registBoard(@RequestParam("etc") MultipartFile file, @RequestParam("categoryNo") int categoryNo, @RequestParam("title") String title, @RequestParam("content") String content, Model model) {
		Date regDate = new Date();
		System.out.println(categoryNo);
		System.out.println("controller통과~~~~~");
		System.out.println(title);
		System.out.println(content);
		
		int view = 0;
		String username = "user1";
		Board board = new Board(title, content, categoryNo, regDate, view, username);
		
		//로그인 후 세션에 저장된 username으로 값 집어넣기
		//첨부파일 존재시 처리방법
		
		if(file.isEmpty()) {
			iBoardDao.registBoard(board);
			model.addAttribute("msg", "글 등록 성공");
			return "member/writeForm";
		} else {
			String fileName = file.getOriginalFilename();
			Random random = new Random();
			fileName = fileName + random.nextInt(100);
			String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
			System.out.println(fileName);
			String uploadDir = Paths.get("src/main/resources/static/images/").toAbsolutePath().toString() + "/";
			File dir = new File(uploadDir);
	        if (!dir.exists()) {
	            dir.mkdirs();  // 디렉토리 생성
	        }
			try {
				File destFile = new File(uploadDir + fileName);
				file.transferTo(destFile);
				board.setEtc(uniqueFileName);
				iBoardDao.registFileBoard(board);
				model.addAttribute("msg", "파일 업로드 성공");
				return "member/writeForm";
			} catch(Exception e){
				e.printStackTrace();
				model.addAttribute("msg", "파일 업로드 실패");
				return "member/writeForm";
			}
		}
	}
	
	@RequestMapping("/boardDetail")
	public String boardDetail(@RequestParam("bno") int bno, Model model) {
		System.out.println("bno : " + bno); 
		Board boardDetail = iBoardDao.getBoardDetail(bno);
		//조회수 카운트
		int view = boardDetail.getView() + 1;
		System.out.println("view: " + view);
		iBoardDao.boardViewCnt(view, bno);
		//게시판 디테일 내용
		boardDetail.setView(view);
		model.addAttribute("boardDetail",boardDetail);
		//카테고리 이름
		model.addAttribute("categoryName", iBoardDao.getCategoryName(boardDetail.getCategoryNo()));
		//게시판 글 작성자 정보
		String username = boardDetail.getUsername();
		model.addAttribute("user", iBoardDao.getUserName(username));
		//작성일자 포맷
		Date regDate = boardDetail.getRegDate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String strFormatDate = sdf.format(regDate);
		model.addAttribute("regDate", strFormatDate);
		//임시 로그인 유저네임
		String loginUsername = "user2";
		//좋아요 이모지 상태 
		Like likeState = iBoardDao.getLikeState(loginUsername, bno);
		if(likeState == null || !likeState.isLikeState()) {
			model.addAttribute("likeState", 0);
		} else if(likeState.isLikeState()) {
			model.addAttribute("likeState", 1);
		}
		//해당 게시물 총 좋아요 수
		model.addAttribute("totalLike", iBoardDao.getBoardTotalLike(bno));
		//해당 게시물 댓글 리스트
		//댓글 작성자 이름 출력
		List<Reply> replyList = iBoardDao.getReplyList(bno);
		List<Reply> newReplyList = new ArrayList<>();
		for(Reply reply : replyList) {
			//username값을 통해서 얻어낸 실제 이름 데이터
			String replyUsername = reply.getUsername();
			User replyUser = iBoardDao.getUserName(replyUsername);
			reply.setName(replyUser.getName());
			//댓글 작성일자 포맷
			Date replyRegDate = reply.getReplyDate();
			String formatDate = sdf.format(replyRegDate);
			reply.setFormatDate(formatDate);
			System.out.println("replyUsername: " + replyUsername + ", replyDate : " + replyRegDate);
			newReplyList.add(reply);
			System.out.println("reply : " + reply);
			
		}
		model.addAttribute("replyList", newReplyList);
		//댓글창 로그인한 사람 이름 노출
		model.addAttribute("loginUser", iBoardDao.getUserName(loginUsername));

		return "member/detailPage";
	}
	
	@RequestMapping("/regReply")
	public String regReply(@RequestParam("replyContent") String replyContent, @RequestParam("username") String username, @RequestParam("bno") int bno) {
		System.out.println("replyContent : " + replyContent + ", username : " + username + ", bno : " + bno);
		Date replyDate = new Date();
		Reply reply = new Reply(replyContent, replyDate, username, bno);
		iBoardDao.regReply(reply);
		return "redirect:/member/boardDetail?bno="+bno;
	}
	
	@RequestMapping("/updateLikeState")
	public String boardLike(@RequestParam("bno") int bno, @RequestParam("likeState") int likeState, @RequestParam("username") String username) {
		System.out.println("좋아요 컨트롤러~~~~~~");
		System.out.println("bno : " + bno + ", likeState : " + likeState + ", username : " + username);
		int likeCheck = iBoardDao.getBoardLikeCheck(bno, username);
		
		if(likeCheck == 0) {
			Like like = new Like(username, bno, true);
			iBoardDao.regBoardLike(like);
		} else {
			if(likeState == 0) {
				iBoardDao.updateBoardLike(bno, username, true);
			} else if(likeState == 1) {
				iBoardDao.updateBoardLike(bno, username, false);
			} 
		}
		
		
		return "redirect:/member/boardDetail?bno="+bno;
	}
	
}
