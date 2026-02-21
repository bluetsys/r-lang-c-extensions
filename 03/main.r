# C로 작성된 코사인 유사도 라이브러리 로드
dyn.load("cosine_similarity.so")

cosine_similarity <- function(vectorA, vectorB) {
	# 벡터가 숫자형인지 확인
	if (!is.numeric(vectorA) || !is.numeric(vectorB))
		stop("arguments must be numeric")
	
	# 벡터의 길이가 같은지 확인
	if (length(vectorA) != length(vectorB))
		stop("vectors must be of the same length")
	
	# 벡터의 길이 계산
	len <- length(vectorA)

	# C 함수 호출
	out <- .C("cosine_similarity",
			len=as.integer(len),
			vectorA=as.double(vectorA),
			vectorB=as.double(vectorB),
			result=as.double(0))
	
	return(out$result)
}

# 벡터 정의
vector1 <- 1:4
vector2 <- 4:7

# 벡터 출력
print(vector1)
print(vector2)

# 코사인 유사도 계산
result <- cosine_similarity(vector1, vector2)

# 결과 출력
print(result)

# C로 작성된 라이브러리 언로드
dyn.unload("cosine_similarity.so")