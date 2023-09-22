package mvc.main;


import mvc.Entity.BookEntity;
import mvc.configuration.JPAConfig;
import mvc.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class main {
    static AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext(JPAConfig.class);
    static BookRepository bookRepository = applicationContext.getBean("bookRepository", BookRepository.class);
    public static void main(String[] args) {
        List<BookEntity> bookEntityList=(List<BookEntity>) bookRepository.findAll();
        for (BookEntity book:bookEntityList){
            System.out.println(book.toString());
        }
    }
}
