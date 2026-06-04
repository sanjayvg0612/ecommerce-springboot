package com.jtspringproject.JtSpringProject.dao;

import java.util.Collections;
import java.util.List;

import com.jtspringproject.JtSpringProject.models.CartProduct;
import com.jtspringproject.JtSpringProject.models.CartProductId;
import com.jtspringproject.JtSpringProject.models.Product;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class cartProductDao {
    private final SessionFactory sessionFactory;

    public cartProductDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Transactional
    public CartProduct addCartProduct(CartProduct cartProduct) {
        this.sessionFactory.getCurrentSession().save(cartProduct);
        return cartProduct;
    }

    @Transactional
    public List<CartProduct> getCartProducts() {
        return this.sessionFactory.getCurrentSession().createQuery("from CART_PRODUCT", CartProduct.class).list();
    }

    @Transactional
    public CartProduct getCartProduct(CartProductId id) {
        return this.sessionFactory.getCurrentSession().get(CartProduct.class, id);
    }

    @Transactional
    public List<Product> getProductByCartID(Integer cart_id) {
        try {
            return this.sessionFactory.getCurrentSession()
                    .createQuery("select cp.product from CartProduct cp where cp.cart.id = :cart_id", Product.class)
                    .setParameter("cart_id", cart_id)
                    .list();
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Transactional
    public void updateCartProduct(CartProduct cartProduct) {
        this.sessionFactory.getCurrentSession().update(cartProduct);
    }

    @Transactional
    public void deleteCartProduct(CartProduct cartProduct) {
        this.sessionFactory.getCurrentSession().delete(cartProduct);
    }
}

