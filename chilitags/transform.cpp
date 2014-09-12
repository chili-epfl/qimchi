#include "transform.h"

Transform::Transform(QQuickItem *parent)
    : QQuickTransform(parent)
    , m_matrix()
{
}

QMatrix4x4 Transform::matrix() const{
    return m_matrix;
}

void Transform::setMatrix(QMatrix4x4 matrix)
{
   if (m_matrix == matrix)
   return;
   m_matrix = matrix;
   update();
   emit matrixChanged();
}

void Transform::applyTo(QMatrix4x4 *matrix) const {
    matrix->operator *=(m_matrix);
}
