package assignment.java5.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table
@Data
@AllArgsConstructor
@NoArgsConstructor
public class thuonghieu {
    @Id
    String id;
    
    String name;
    @OneToMany(mappedBy = "thuonghieu")
    List<product> products;
}
