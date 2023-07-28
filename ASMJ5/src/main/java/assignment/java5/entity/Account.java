package assignment.java5.entity;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "Users")

@Data
@NoArgsConstructor @AllArgsConstructor
public class Account {
     @Id
     @NotEmpty(message = "")
     String Username;
     @NotEmpty(message = "")
     String Fullname;
     @NotEmpty(message = "")
     String Password;
     @NotEmpty(message = "")
     @Pattern(regexp = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$")
     String Sdt;
     @NotEmpty(message = "")
     @Email(message = "")
     String Email;
     @NotEmpty(message = "")
     String diachi;

     Boolean vaitro;
     Boolean trangthai;
     @JsonIgnore
 	@OneToMany(mappedBy = "user")
 	List<gioHang> gioHangUser;
}
