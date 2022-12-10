Objective:

1.Model Comparison tool is used for evaluating  Configuration parameters diference as a additional feature which is not present in SimDiff Tool 
2.To generate comparison report for Block Parameter properties of Simulink Models
3.To Automate the Gap Analysis report for Model Merging

Process flow:

1. Simulink Models subjected for comparing Configuration and Block Parameters are the inputs to the tool
2. Comparison Reports are generated after execution of Model Comparison in Excel 
      a.Configuration Parameter Difference
      b.Block Parameter Difference


Results as expected:
1. Comparison of Configuration Parameters is working as expected
2. Over 70% of Manual task is reduced in preparation of Gap Analysis Report

Drawbacks:
1. The result of Block parameter comparison is accurate upto 90% when compared to Simdiff tool report as the comparison approach is based on only parameter properties difference not on logical difference.