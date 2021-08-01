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
