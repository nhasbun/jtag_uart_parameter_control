#include "main.h"

#ifdef VALUE_BASE
#elif  IDENTIFIER_BASE
#endif

#define BUF 32
#define DELAY 100

#define MENSAJE "*** INICIANDO SISTEMA ***\n"
#define ESPERANDO "esperando comando...\n"

int main()
{
  // ** Inicio rutina
  alt_putstr(MENSAJE);

  char entrada[BUF] = { 0 }; // **
  // Idealmente aca iría un malloc(), pero esto permite ahorrar esa librería
  // sin mayores problemas.

  while(1) {
    alt_putstr(ESPERANDO);

    leer_uart(entrada);
    alt_putstr(entrada); alt_putstr("\n");

    uint32_t identifier = my_atoi(entrada);

    leer_uart(entrada);
    alt_putstr(entrada); alt_putstr("\n");

    uint32_t value = my_atoi(entrada);

    alt_write_word(IDENTIFIER_BASE, identifier);
    alt_write_word(VALUE_BASE, value);

    usleep(DELAY);
  }
  return 0;
}

void leer_uart(char * input)
{
  while(1) {
    *input = alt_getchar();
    if (*input == '\n') break;
    input++;
  }

  *input = '\0'; // cierre obligatorio de string y sobreescribimos '\n'
}
