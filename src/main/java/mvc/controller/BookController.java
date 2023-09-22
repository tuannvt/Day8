package mvc.controller;

import java.util.LinkedHashMap;
import java.util.Map;
import mvc.Entity.BookEntity;
import mvc.Entity.CategoryEntity;
import mvc.repository.BookRepository;
import mvc.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookController {
    @Autowired
    BookRepository bookRepository;
    @Autowired
    CategoryRepository categoryRepository;
    @RequestMapping(value = "/index")
    public String index(){
        return "index";
    }
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String showBooks(Model model){
        List<BookEntity> bookList=(List<BookEntity>)bookRepository.findAll();
        model.addAttribute("bookList",bookList);
        return "book/home";
    }
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public String searchBooks(@RequestParam("searchInput")String searchInput,Model model){
        List<BookEntity> reasultList;
        if (searchInput.isEmpty()){
            reasultList=(List<BookEntity>)bookRepository.findAll();
        }else {
            reasultList=bookRepository.findByNameContainingOrAuthorContaining(searchInput,searchInput);
        }
        model.addAttribute("bookList",reasultList);
        return "book/home";
    }
    @RequestMapping(value = "/newBook",method = RequestMethod.GET)
    public String showNewBooks(Model model){
        model.addAttribute("book",new BookEntity());
        model.addAttribute("msg","Add a new book");
        model.addAttribute("action","newBook");
        setCategoryDropDownlist(model);
        return "book/book";
    }
    @RequestMapping(value = "/newBook",method = RequestMethod.POST)
    public String saveBook(BookEntity book){
        bookRepository.save(book);
        return "redirect:/";
    }

    private void setCategoryDropDownlist(Model model) {
        List<CategoryEntity> cateList=(List<CategoryEntity>)categoryRepository.findAll();
        if (!cateList.isEmpty()){
            Map<Integer,String> cateMap=new LinkedHashMap<>();
            for (CategoryEntity categoryEntity:cateList){
                cateMap.put(categoryEntity.getId(),categoryEntity.getName());
            }
            model.addAttribute("categoryList",cateMap);
        }
    }
}
