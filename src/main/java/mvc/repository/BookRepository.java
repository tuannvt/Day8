package mvc.repository;


import mvc.Entity.BookEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BookRepository extends CrudRepository<BookEntity,Integer> { ;
    List<BookEntity> findByNameContainingOrAuthorContaining(String name,String author);
}
