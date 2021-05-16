package application;
	
import java.sql.Connection;
import java.sql.SQLException;

import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.fxml.FXMLLoader;

public class Main extends Application {
	public static Connection connection;
	
	public void initDatabase() throws ClassNotFoundException, SQLException {
		connection = ConnectDB.getOracleConnection();
	}
	@Override
	public void start(Stage primaryStage) {
		try {
			AnchorPane root = (AnchorPane)FXMLLoader.load(getClass().getResource("loginUI.fxml"));
			primaryStage.setTitle("Login");
			Scene scene = new Scene(root,415,494);
			scene.getStylesheets().add(getClass().getResource("application.css").toExternalForm());
			primaryStage.setScene(scene);
			primaryStage.show();
			initDatabase();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		launch(args);
		
	}
}
