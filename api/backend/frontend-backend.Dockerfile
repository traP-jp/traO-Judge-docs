FROM swaggerapi/swagger-ui:v5.3.1
COPY api/backend/frontend-backend.yaml /openapi.yaml
ENV SWAGGER_JSON=/openapi.yaml