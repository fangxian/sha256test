#include "sha256.h"
#include <stdio.h>
#include <string.h>

int main(void)
{
    /*
    char *buf[] = {
        "",
        "e3b0c442 98fc1c14 9afbf4c8 996fb924 27ae41e4 649b934c a495991b 7852b855",

        "abc",
        "ba7816bf 8f01cfea 414140de 5dae2223 b00361a3 96177a9c b410ff61 f20015ad",

        "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq",
        "248d6a61 d20638b8 e5c02693 0c3e6039 a33ce459 64ff2167 f6ecedd4 19db06c1",

        "The quick brown fox jumps over the lazy dog",
        "d7a8fbb3 07d78094 69ca9abc b0082e4f 8d5651e4 6d3cdb76 2d02d0bf 37c9e592",

        "The quick brown fox jumps over the lazy cog", // avalanche effect test
        "e4c4d8f3 bf76b692 de791a17 3e053211 50f7a345 b46484fe 427f6acc 7ecc81be",

        "bhn5bjmoniertqea40wro2upyflkydsibsk8ylkmgbvwi420t44cq034eou1szc1k0mk46oeb7ktzmlxqkbte2sy",
        "9085df2f 02e0cc45 5928d0f5 1b27b4bf 1d9cd260 a66ed1fd a11b0a3f f5756d99"
    };
    */

    char buf[64] = {0};
    FILE* fp = fopen("ref.seed", "r+");
    uint8_t hash[SHA256_SIZE_BYTES];

    fread(buf, 1, 64, fp);

    sha256(buf, 64, hash);
    printf("input = %s\nlen = %lu \n", buf, strlen(buf));
    for (size_t j = 0; j < SHA256_SIZE_BYTES; j++) {
        printf("%02x%s", hash[j], ((j % 4) == 3) ? " " : "");
    }
    printf("\n");
    return 0;
}
