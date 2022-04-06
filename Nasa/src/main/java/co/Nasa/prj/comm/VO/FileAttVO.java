package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class FileAttVO {
	String filecode;
	String create_dt;
	String use_at;
	String file_save;
	String file_savename;
	String orignl_file;
	String file_ext;
	String file_sub;
	String file_size; // int나 double 인가..?
}
