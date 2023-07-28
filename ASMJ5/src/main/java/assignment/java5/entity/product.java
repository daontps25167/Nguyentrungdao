package assignment.java5.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "sanpham")

@Data
@NoArgsConstructor @AllArgsConstructor
public class product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer idSP;
	String TenSP;
	String HinhSP;
	@ManyToOne
	@JoinColumn(name = "Thuonghieu")
	thuonghieu thuonghieu;
	int sl;
	double gia;
	@Temporal(TemporalType.DATE)
	Date ngaytao = new Date();
	String ghichu;
	boolean Loai;
	 	@OneToMany(mappedBy = "product")
	 	List<gioHang> gioHangSP;
}
