import com.intuit.karate.junit5.Karate;

public class ProductsRun {
    @Karate.Test
    Karate testProducts(){
        return Karate.run("src/main/resources/Products.feature");
    }
}
