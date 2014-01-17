#include <stdio.h>
#include <stdbool.h>
#include <time.h>

struct Person {
  char *name;
  bool gave_gift;
  bool received_gift;
};

struct GiftGiver;

int main()
{
  srand(time(NULL));
  struct Person people[] = {
    { "John Doe", false, false },
    { "Jane Doe", false, false },
    { "Aretha Franklin", false, false },
    { "Benjamin Franklin", false, false }
  };

  int people_len = sizeof(people) / sizeof(people[0]);

  for (int i = 0; i < people_len; ++i)
  {
    do
    {
      int random_num = rand() % people_len;
      // printf("Num: %d\n", random_num);
      printf("Gave gift: %d\n", people[i].gave_gift);
      if (!people[random_num].received_gift && random_num != i)
      {
        people[random_num].received_gift = true;
        people[i].gave_gift = true;
      }
    }
    while (!people[i].gave_gift);

    printf("Name: %s\n", people[i].name);
    printf("Gave Gift: %d\n", people[i].gave_gift);
    printf("Received Gift: %d\n", people[i].received_gift);
  }
  return 0;
}

struct GiftGiver {
  struct Person *giver;
  struct Person *recipient;
};