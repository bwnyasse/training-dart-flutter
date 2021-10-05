package net.bwnyasse;

public class MovieNotFoundException extends Exception{
    public MovieNotFoundException(String errorMessage) {
        super(errorMessage);
    }
}
