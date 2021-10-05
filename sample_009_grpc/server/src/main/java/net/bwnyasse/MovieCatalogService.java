package net.bwnyasse;

import static io.grpc.Status.ALREADY_EXISTS;
import static io.grpc.Status.NOT_FOUND;
import io.grpc.StatusException;
import io.grpc.stub.StreamObserver;
import java.util.ArrayList;
import java.util.List;

//We need to extend the generated gRPC Service Stubs so that we can create true implementations for them here
public class MovieCatalogService extends MovieCatalogGrpc.MovieCatalogImplBase {
    private final List<MovieItem> moviesInCatalog;

    public MovieCatalogService() {
        // Populate our collection of movies available to query for. To keep things
        // simple, we will just store data in memory.
        MovieItem schindlersList = MovieItem.newBuilder().setName("Schindler's List").setPrice(12.99d).setInStock(true)
                .build();
        MovieItem piratesOfSiliconValley = MovieItem.newBuilder().setName("The Pirates of Silicon Valley")
                .setPrice(10.99d).setInStock(true).build();
        MovieItem warGames = MovieItem.newBuilder().setName("War Games").setPrice(22.99d).setInStock(true).build();
        MovieItem princessBride = MovieItem.newBuilder().setName("The Princess Bride").setPrice(15.99d).setInStock(true)
                .build();
        MovieItem lionKing = MovieItem.newBuilder().setName("The Lion King").setPrice(24.99d).setInStock(true).build();
        MovieItem aKnightsTale = MovieItem.newBuilder().setName("A Knight's Tale").setPrice(8.99d).setInStock(true)
                .build();
        moviesInCatalog = new ArrayList<>();
        moviesInCatalog.add(schindlersList);
        moviesInCatalog.add(piratesOfSiliconValley);
        moviesInCatalog.add(warGames);
        moviesInCatalog.add(princessBride);
        moviesInCatalog.add(lionKing);
        moviesInCatalog.add(aKnightsTale);
    }

    // We need to override each of the protobuf `rpc` methods we defined in our
    // `.proto` file
    @Override
    public void fetchExistingMovie(FetchMovieRequest request, StreamObserver<MovieItem> responseObserver) {
        MovieItem fetchedMovie;
        try {
            // Grab the first movie that has a substring of the requested movie's name
            fetchedMovie = moviesInCatalog.stream().filter(movie -> movie.getName().contains(request.getName()))
                    .findFirst().orElseThrow(() -> new MovieNotFoundException(request.getName()));
        } catch (MovieNotFoundException e) {
            e.printStackTrace();
            // Throw an exception visible to the client (NOT_FOUND is a constant defined in
            // the generated gRPC error handling code. We use StatusException for reporting
            // gRPC call exceptions back over the wire.)
            responseObserver.onError(new StatusException(NOT_FOUND));
            return;
        }
        System.out.println("Found movie: " + fetchedMovie.getName());
        // Send response (this needs to be called in order to return the value we
        // fetched back to the client)
        responseObserver.onNext(fetchedMovie);
        // Close request gracefully
        responseObserver.onCompleted();
    }

    // This follows basically the same flow as the previous method as far as
    // gRPC-related things
    @Override
    public void saveNewMovie(MovieItem request, StreamObserver<AddMovieResponse> responseObserver) {
        boolean movieAlreadyExists = moviesInCatalog.stream()
                .anyMatch(movie -> movie.getName().equalsIgnoreCase(request.getName()));
        if (movieAlreadyExists) {
            System.err.println("Movie " + request.getName() + " already exists!");
            responseObserver.onError(new StatusException(ALREADY_EXISTS));
        } else {
            moviesInCatalog.add(request);
            System.out.println("Saved movie: " + request.getName());
            // We will treat the id as just the index of the item in our in-memory list
            AddMovieResponse response = AddMovieResponse.newBuilder().setWasSaved(true)
                    .setItemId(moviesInCatalog.indexOf(request)).build();
            responseObserver.onNext(response);
            responseObserver.onCompleted();
        }
    }
}