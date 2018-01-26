#include <unistd.h> // usleep()
#include <system.h>
#include <stdint.h> // uints types
#include <stdbool.h>

#include "sys/alt_stdio.h"
#include "sys/alt_irq.h" // sistema de interrupciones
#include "altera_avalon_pio_regs.h" // **
// funciones IOWR_ALTERA_AVALON_PIO_IRQ_MASK()
//           IORD_ALTERA_AVALON_PIO_EDGE_CAP()

#include "./functions/my_atoi.h"

#define BIT(x,n) (((x) >> (n)) & 1)

// ** Macros útiles robados de Altera SoCAL
#ifdef __ASSEMBLY__
#define ALT_CAST(type, ptr)  ptr
#else   /* __ASSEMBLY__ */

#define ALT_CAST(type, ptr)  ((type) (ptr))
#endif  /* __ASSEMBLY__ */

#define alt_write_byte(dest, src)       (*ALT_CAST(volatile uint8_t *, (dest)) = (src))
#define alt_read_byte(src)              (*ALT_CAST(volatile uint8_t *, (src)))
#define alt_write_hword(dest, src)      (*ALT_CAST(volatile uint16_t *, (dest)) = (src))
#define alt_read_hword(src)             (*ALT_CAST(volatile uint16_t *, (src)))
#define alt_write_word(dest, src)       (*ALT_CAST(volatile uint32_t *, (dest)) = (src))
#define alt_read_word(src)              (*ALT_CAST(volatile uint32_t *, (src)))
#define alt_write_dword(dest, src)      (*ALT_CAST(volatile uint64_t *, (dest)) = (src))
#define alt_read_dword(src)             (*ALT_CAST(volatile uint64_t *, (src)))
// *********************************************************

void leer_uart(char * comando);
void rutina_lectura();
void rutina_escritura();

