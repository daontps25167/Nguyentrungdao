package assignment.java5.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "Giohang",uniqueConstraints =@UniqueConstraint(columnNames = {"idSP",
		"Username"}))

@Data
@NoArgsConstructor @AllArgsConstructor
public class gioHang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer idgiohang;
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@ManyToOne @JoinColumn(name = "idSP")
	product product;
	
	int sl;
	double thanhtien;
	@ManyToOne @JoinColumn(name = "Username")
	Account user;
	@Temporal(TemporalType.DATE)
	Date ngayadd = new Date();
}
