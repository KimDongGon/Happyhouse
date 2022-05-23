package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.model.dto.QnaDto;
import com.ssafy.happyhouse.model.dto.ReplyDto;

@Mapper
public interface QnaMapper {
	/**
	 * QnA 게시글 전체 조회
	 * @param
	 * @return List
	 * */
	public List<QnaDto> selectQna(Map<String, Object> map);
	
	/**
	 * QnA 게시글 아이디로 조회
	 * @param id
	 * @return
	 */
	public List<QnaDto> selectQnaById(String id);
	/**
	 * QnA 게시글 상세 조회
	 * @param no
	 * @return QnaDto
	 * */	
	public QnaDto selectQnaByNo(int no);
	/**
	 * QnA 게시글 등록
	 * @param qnaDto
	 * @return
	 */
	public int insertQna(QnaDto qnaDto);
	/**
	 * Qna 게시글 수정
	 * @param qnaDto
	 * @return
	 */
	public int updateQna(QnaDto qnaDto);
	/**
	 * QnA 게시글 삭제
	 * @param no
	 * @return
	 */
	public int deleteQna(Map<String,Object> map);
	/**
	 * QnA 게시글 조회수 증가
	 * @param qnaDto
	 */
	public void increaseHitCount(QnaDto qnaDto);
	/**
	 * QnA 게시글 총 댓글 수 조회
	 * @param no
	 * @return
	 */
	public void replyCount(int no);
	/**
	 * QnA 게시글 댓글 조회
	 * @param replyDto
	 * @return
	 */
	public List<ReplyDto> selectReply(int no);
	/**
	 * QnA 게시글 댓글 작성
	 * @param replyDto
	 * @return
	 */
	public int insertReply(ReplyDto replyDto);
	/**
	 * QnA 게시글 댓글 수정
	 * @param replyDto
	 * @return
	 */
	public int updateReply(ReplyDto replyDto);
	/**
	 * QnA 게시글 댓글 삭제
	 * @param replyDto
	 * @return
	 */
	public int deleteReply(Map<String, Object> map);

	/**
	 * QnA 게시글 전체 수 조회
	 * @return
	 */
	public int selectQnaTotalCount();
	
	public List<QnaDto> selectQnaLimitOffset(@Param("limit") int limit, @Param("offset") int offset);
}

