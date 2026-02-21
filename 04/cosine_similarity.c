#include <math.h>

void cosine_similarity(int *len, double *vectorA, double *vectorB, double *result)
{
	// 벡터 길이 가져오기
	int n = *len;

	// 내적과 크기 계산을 위한 변수 초기화
	double dot_product = 0.0;
	double magnitude_a = 0.0;
	double magnitude_b = 0.0;

	// 벡터의 내적과 크기 계산
	for (int i = 0; i < n; i++)
	{
		dot_product += vectorA[i] * vectorB[i];
		magnitude_a += vectorA[i] * vectorA[i];
		magnitude_b += vectorB[i] * vectorB[i];
	}

	// 크기 계산
	magnitude_a = sqrt(magnitude_a);
	magnitude_b = sqrt(magnitude_b);

	// 코사인 유사도 계산
	*result = dot_product / (magnitude_a * magnitude_b);
}