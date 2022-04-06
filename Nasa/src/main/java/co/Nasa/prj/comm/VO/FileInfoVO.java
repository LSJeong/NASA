package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class FileInfoVO {
	String file_code;
	String file_num;
	String file_save; // 파일 저장 경로
	String file_savename;
	String orignl_file; // 원 파일 명
	String file_ext; // 파일 확장자
	String file_sub; // 파일 내용
	String file_size; // 파일 크기
}
