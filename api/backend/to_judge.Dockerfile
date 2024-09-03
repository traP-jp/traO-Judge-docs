FROM swaggerapi/swagger-ui:v5.3.1
COPY api/backend/to_judge.yaml /api/backend/to_judge.yaml
ENV SWAGGER_JSON=/api/backend/to_judge.yaml