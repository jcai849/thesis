typedef struct Promise {
    int fd;
    char state[STATE_SIZE+1];
    SEXP value;

    struct Promise *then[MAX_THENS]; /* private */
    int then_i;		             /* private */

    SEXP onFulfilled; /* used only for then */
    SEXP onRejected;  /* used only for then */
} Promise;
