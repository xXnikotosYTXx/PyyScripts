local uiMath = {}

function uiMath.addUDim(a, b)
	return UDim.new(a.Scale + b.Scale, a.Offset + b.Offset)
end

function uiMath.addUDim2(a, b)
	return UDim2.new(
		a.X.Scale + b.X.Scale,
		a.X.Offset + b.X.Offset,
		a.Y.Scale + b.Y.Scale,
		a.Y.Offset + b.Y.Offset
	)
end

function uiMath.multiplyUDim(a, scalar)
	return UDim.new(a.Scale * scalar, a.Offset * scalar)
end

function uiMath.multiplyUDim2(a, scalar)
	return UDim2.new(
		a.X.Scale * scalar,
		a.X.Offset * scalar,
		a.Y.Scale * scalar,
		a.Y.Offset * scalar
	)
end

function uiMath.lerpUDim2(a, b, alpha)
	return UDim2.new(
		a.X.Scale + (b.X.Scale - a.X.Scale) * alpha,
		a.X.Offset + (b.X.Offset - a.X.Offset) * alpha,
		a.Y.Scale + (b.Y.Scale - a.Y.Scale) * alpha,
		a.Y.Offset + (b.Y.Offset - a.Y.Offset) * alpha
	)
end

function uiMath.vector2ToUDim2(v)
	return UDim2.new(0, v.X, 0, v.Y)
end

function uiMath.udim2ToVector2(u)
	return Vector2.new(u.X.Offset, u.Y.Offset)
end

function uiMath.offsetToScale(offset, totalSize)
	return offset / totalSize
end

function uiMath.scaleToOffset(scale, totalSize)
	return scale * totalSize
end

function uiMath.offsetUdimToScaleUdim(udim, totalSize)
	return UDim.new(udim.Scale + (udim.Offset / totalSize), 0)
end

function uiMath.scaleUdimToOffsetUdim(udim, totalSize)
	return UDim.new(0, udim.Scale * totalSize + udim.Offset)
end

function uiMath.offsetUdim2ToScaleUdim2(udim2, totalSize)
	return UDim2.new(
		udim2.X.Scale + (udim2.X.Offset / totalSize.X),
		0,
		udim2.Y.Scale + (udim2.Y.Offset / totalSize.Y),
		0
	)
end

function uiMath.scaleUdim2ToOffsetUdim2(udim2, totalSize)
	return UDim2.new(
		0,
		udim2.X.Scale * totalSize.X + udim2.X.Offset,
		0,
		udim2.Y.Scale * totalSize.Y + udim2.Y.Offset
	)
end

return uiMath
