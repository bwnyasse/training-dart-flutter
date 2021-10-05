package net.bwnyasse;

import io.grpc.Server;
import io.grpc.ServerBuilder;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class App {
    public static void main(String[] args) throws IOException, InterruptedException {
        MovieCatalogService service = new MovieCatalogService(); // Instantiate our service that we defined above
        System.out.println("Starting movie server...");
        final int port = 9090;
        final Server server = ServerBuilder.forPort(port).addService(service) // Here is where we register the service
                                                                     // implementation we just completed to our server
                .build().start(); // Start the server
        System.out.println("Server started on port " + port + "!");
        server.awaitTermination(); // Wait until the app is killed so that our server doesn't stop immediately.
        // This is some magic to make sure we don't keep the server running if the app
        // is terminated externally
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            // Use stderr here since the logger may have been reset by its JVM shutdown
            // hook.
            System.err.println("*** shutting down gRPC server since JVM is shutting down");
            try {
                stopServer(server);
            } catch (InterruptedException e) {
                e.printStackTrace(System.err);
            }
            System.err.println("*** server shut down");
        }));
    }

    private static void stopServer(Server server) throws InterruptedException {
        if (server != null) {
            server.shutdown().awaitTermination(30, TimeUnit.SECONDS);
        }
    }
}
