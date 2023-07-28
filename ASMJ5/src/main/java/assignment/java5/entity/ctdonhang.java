package assignment.java5.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Chitietdonhang")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ctdonhang {
      @Id
      @GeneratedValue(strategy = GenerationType.IDENTITY)
      Integer id;
      
      @GeneratedValue(strategy = GenerationType.IDENTITY)
      @ManyToOne@JoinColumn(name = "Iddonhang")
      donhang donhang;
      
      @GeneratedValue(strategy = GenerationType.IDENTITY)
  	@ManyToOne @JoinColumn(name = "idSP")
      product idsp;
      int sl;
      double gia;
      double thanhtien;
      
}
