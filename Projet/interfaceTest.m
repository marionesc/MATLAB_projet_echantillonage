function pushbuttonPlot
f = figure;
ax = axes(f);
ax.Units = 'pixels';
ax.Position = [75 75 325 280]
c = uicontrol;
c.String = 'Plot Data';
c.Callback = @plotButtonPushed;

    function plotButtonPushed(src,event)
        bar(randn(1,5));
    end

end