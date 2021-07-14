#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

double _fahrenheit_to_celsius(double temperature) {
  return (5.0f / 9.0f) * (temperature - 32);
}

char *get_definition() {
  return "The National Basketball Association, or NBA, is a professional "
         "basketball league comprised of 30 teams across North America "
         "featuring the best basketball players in the world.";
}

int get_max_of_players() { return 450; }

char *get_best_player() {
  char *best = "Lebron James";
  char *best_m = malloc(strlen(best));
  strcpy(best_m, best);
  return best_m;
}

struct NbaFAQ {
  double avg_temp_arena;
  int time_quarters;
  int players_roster;
};

struct NbaFAQ get_nba_faq(bool useCelsius) {
  struct NbaFAQ faq;
  faq.avg_temp_arena = 70.0f;
  faq.time_quarters = 12;
  faq.players_roster = 15;

  if (useCelsius) {
    faq.avg_temp_arena = _fahrenheit_to_celsius(faq.avg_temp_arena);
  }
  return faq;
}

/*
int main(void) {
  printf("What is the NBA = %s \n", get_definition());
  printf("-------\n");
  printf("There are a maximum of %d players \n", get_max_of_players());
  printf("-------\n");
  printf("The actual best player might be %s \n", get_best_player());
  printf("-------\n");

  struct NbaFAQ faq = get_nba_faq(false);
  printf("NBA Frequently Asked Questions\n");
  printf("--> avg tmp in arena : %lf °F\n", faq.avg_temp_arena);
  printf("--> How long are the quarters? : %d minutes\n", faq.time_quarters);
  printf("--> How many players by roster? : %d players\n", faq.players_roster);
  printf("-------\n");
  faq = get_nba_faq(true);
  printf("--> in °C, the avg tmp in arena is : %lf °C\n", faq.avg_temp_arena);

  printf("-------\n");
  return 0;
}*/