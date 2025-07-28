import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;

public class DirectUpdateBinding extends Application {

    @Override
    public void start(Stage primaryStage) {
        TextField t1 = new TextField();
        TextField t2 = new TextField();
        Label t3 = new Label();

        t1.textProperty().addListener((observable, oldValue, newValue) -> {
            t3.setText(t1.getText() + t2.getText());
        });

        t2.textProperty().addListener((observable, oldValue, newValue) -> {
            t3.setText(t1.getText() + t2.getText());
        });

        HBox root = new HBox(t1, t2, t3);
        Scene scene = new Scene(root, 300, 100);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
