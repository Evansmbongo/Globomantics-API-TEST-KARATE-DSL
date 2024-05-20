import com.intuit.karate.junit5.Karate;


public class CategoriesRun {
    @Karate.Test
    Karate testCategories(){
        return Karate.run("src/main/resources/Categories.feature");
    }

}
