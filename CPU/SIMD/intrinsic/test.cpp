#include <immintrin.h>
#include <stdio.h>
#include <type_traits>


template<typename T, typename VecType = __m256>
void Disp(T* pData)
{
  for(int i=0; i<sizeof(VecType)/sizeof(*pData); i++)
  {
    if constexpr(std::is_same<T, char>::value || std::is_same<T, short>::value || std::is_same<T, int>::value)
      printf("%d ", pData[i]);
    if constexpr(std::is_same<T, long>::value) 
      printf("%ld ", pData[i]);
    if constexpr(std::is_same<T, float>::value) 
      printf("%f ", pData[i]);
    if constexpr(std::is_same<T, double>::value) 
      printf("%lf ", pData[i]);
  }
  printf("\n");
}

__m256 vec_float;
__m256d vec_double;
__m256i vec_int;
void SetTest()
{
  //Fill a vector with an integer
  vec_int = _mm256_set1_epi16(8);
  Disp((short*)&vec_int);

  vec_float = _mm256_set1_ps(8.8);
  Disp((float*)&vec_float);

  vec_double = _mm256_set1_pd(8.8);
  Disp((double*)&vec_double);

  //Initialize a vector with 8*float or 4*double
  vec_double = _mm256_set_pd(1.1, 1.2, 1.3, 1.4);
  Disp((double*)&vec_double); //1.400000 1.300000 1.200000 1.100000
  vec_double = _mm256_setr_pd(1.1, 1.2, 1.3, 1.4);
  Disp((double*)&vec_double); //1.100000 1.200000 1.300000 1.400000


  double DoubleArray[32] = {2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9};
  double* AlginAddr = (double*) (((long)DoubleArray+32) & (~31l));
  vec_double = _mm256_load_pd(AlginAddr);
  Disp((double*)&vec_double);
  vec_double = _mm256_loadu_pd(AlginAddr+1);
  Disp((double*)&vec_double);
}

// load_  => sligned load   vmovaps
// loadu_ => unaligned load vmovups
void load()
{

}

int main()
{
  SetTest();
}
