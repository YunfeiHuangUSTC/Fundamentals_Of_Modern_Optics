function correlate = ErrorCriterion(Target,Figure)
%Returns the correlation coefficient of Target and Figure
Target1=Target/max(max(Target));
Figure1=Figure/max(max(Figure));
correlate=min(min(corrcoef(Target1,Figure1)));
end