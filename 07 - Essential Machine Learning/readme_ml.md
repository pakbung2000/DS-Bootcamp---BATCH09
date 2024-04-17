
## Content

- Regression Model ver.1
  
  - Using resampling method: `Bootrap`, `LOOCV` and `CV` with knn = 5, 10
  - Setting metric for train model: `RMSE` and `Rsquared`
    
    - Result of training with RMSE metric
      
      ![Screenshot 2024-04-17 161452](https://github.com/pakbung2000/DS-Bootcamp-BATCH09/assets/142192211/01c9d613-e8d4-4ba1-9a0b-ed8c35de3f85)
  
    - Result of training with Rsquared metric
   
      ![Screenshot 2024-04-17 161852](https://github.com/pakbung2000/DS-Bootcamp-BATCH09/assets/142192211/a09da9f4-1a78-4dbc-95b2-daa5dc6a790d)

- Regression Model ver.2

  - Since `CV` with knn models have least Rsquared, I tuned only this model in version 2
  - Add more pre-procession: `preProcess = c("center", "scale")` and `preProcess = "range"`
