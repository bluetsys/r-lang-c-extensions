# 코사인 유사도 계산 함수
cosine_similarity <- function(vector_a, vector_b) {
    # 벡터 길이 확인
    if (length(vector_a) != length(vector_b)) {
        stop("벡터의 길이가 같아야 합니다")
    }

    # 벡터가 비어있는지 확인    
    if (length(vector_a) == 0) {
        stop("벡터는 비어있을 수 없습니다")
    }
    
    # 코사인 유사도 계산
    dot_product <- sum(vector_a * vector_b)
    magnitude_a <- sqrt(sum(vector_a * vector_a))
    magnitude_b <- sqrt(sum(vector_b * vector_b))
    
    # 벡터의 크기가 0인지 확인
    if (magnitude_a == 0 || magnitude_b == 0) {
        stop("벡터의 크기가 0일 수 없습니다")
    }
    
    # 코사인 유사도 반환
    return(dot_product / (magnitude_a * magnitude_b))
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